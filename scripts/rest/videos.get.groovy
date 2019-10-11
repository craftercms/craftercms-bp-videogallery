import scripts.utils.VideosHelper

def start = params.start
def categoryPath = params.category
def search = params.searchInput

def videosHelper = new VideosHelper(elasticsearch, urlTransformationService, start);
def recentVideosStatement = ''

if(categoryPath == 'undefined') {
 recentVideosStatement = "content-type:\"/page/page-video\"";
 if(search != 'undefined' && search != '') {
    // recentVideosStatement = 'content-type:"/page/page-video" AND (internal-name: *'+ search +'* OR tags_o.item.tagName_t: *'+search+'*)'
    // recentVideosStatement = "content-type:\"/page/page-video\" AND internal-name: \"* " + search + "* \""
    recentVideosStatement = "content-type:\"/page/page-video\" AND title_t: \".*" + search + ".*\""
    // recentVideosStatement = "content-type:\"/page/page-video\" AND title_t: \"" + search + "\""
 }
} else {
  path = categoryPath+"/index.xml"
//   recentVideosStatement = 'content-type:"/page/page-video" AND categories_o.item.key:"'+ path +'"'
  recentVideosStatement = "content-type:\"/page/page-video\"";
  if(search != 'undefined' || search != "") {
    // recentVideosStatement = 'content-type:"/page/page-video" AND categories_o.item.key:"'+ categoryPath +'" AND (internal-name: *'+ search +'* OR tags_o.item.tagName_t: *'+search+'*)'
  }
}

return videosHelper.getVideoList(recentVideosStatement)



