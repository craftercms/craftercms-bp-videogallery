import scripts.utils.VideosHelper

def start = params.start
def search = params.searchValue
def path = !params.path ? " ": params.path
def recentVideosStatement = ''

def videosHelper = new VideosHelper(elasticsearch, urlTransformationService, start);

if(search == '') {
	recentVideosStatement = "content-type:\"/page/page-video\""
} else if(path == ' ' || path == 'undefined'){
	recentVideosStatement = "content-type:\"/page/page-video\" AND (title_t: *" + search + "* OR tags_o.item.tagName_t: *" + search + "*)"
} else {
	recentVideosStatement = "content-type:\"/page/page-video\" AND categories_o.item.key: \"" + path + "/index.xml\" AND (title_t: *" + search + "* OR tags_o.item.tagName_t: *" + search + "*)"
}

if(search == '' && (path != 'undefined' && path != " ")) {
	recentVideosStatement = "content-type:\"/page/page-video\" AND categories_o.item.key: \"" + path + "/index.xml\""
}

return videosHelper.getVideoList(recentVideosStatement)
