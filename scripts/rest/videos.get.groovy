import scripts.utils.VideosHelper

def start = params.start
def categoryPath = params.category
def search = params.searchInput

def videosHelper = new VideosHelper(elasticsearch, urlTransformationService, start);
def recentVideosStatement = ''

if(categoryPath == 'undefined') {
 recentVideosStatement = "content-type:\"/page/page-video\"";

 if(search != 'undefined' && search != '') {
    recentVideosStatement = "content-type:\"/page/page-video\" AND (title_t: *" + search + "* OR tags_o.item.tagName_t:  *" + search + "*)"
  }
} else {

  recentVideosStatement = "content-type:\"/page/page-video\" AND categories_o.item.key: \"" + categoryPath + "/index.xml\""

  if(search != 'undefined' || search != "") {
    recentVideosStatement = "content-type:\"/page/page-video\" AND categories_o.item.key: \"" + categoryPath + "/index.xml\" AND (title_t: *" + search + "* OR tags_o.item.tagName_t: *" + search + "*)"
  }
}

return videosHelper.getVideoList(recentVideosStatement)



