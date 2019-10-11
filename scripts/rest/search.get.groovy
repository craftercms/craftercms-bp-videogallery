import scripts.utils.VideosHelper

def start = params.start
def search = params.searchValue
def path = !params.path ? " ": params.path
def recentVideosStatement = ''

def videosHelper = new VideosHelper(elasticsearch, urlTransformationService, start);

logger.info("-------------------------------------------------------------------------------------\n")
logger.info("{}", search)
logger.info("-------------------------------------------------------------------------------------\n")
logger.info("-------------------------------------------------------------------------------------\n")
logger.info("{}", path)
logger.info("-------------------------------------------------------------------------------------\n")


if(search == '') {
	recentVideosStatement = "content-type:\"/page/page-video\""
} else if(path == ' ' || path == 'undefined'){
	// recentVideosStatement = 'content-type:"/page/page-video" AND (internal-name: *'+ search +'* OR tags_o.item.tagName_t: *'+search+'*)'
	// recentVideosStatement = "content-type:\"/page/page-video\" AND title_t: \".*" + search + ".*\""
	
	recentVideosStatement = "title_t: \".*" + search + ".*\""
	// recentVideosStatement = "title_t: \"" + search + "\""
} else {
	// recentVideosStatement = 'content-type:"/page/page-video" AND categories_o.item.key:"'+ path +'" AND (internal-name: *'+ search +'* OR tags_o.item.tagName_t: *'+search+'*)'
	// recentVideosStatement = "content-type:\"/page/page-video\" AND internal-name: \".*" + search + ".*\""
	recentVideosStatement = "content-type:\"/page/page-video\""
}

if(search == '' && (path != 'undefined' || path != " ")) {
	// recentVideosStatement = 'content-type:"/page/page-video" AND categories_o.item.key:"'+ path +'"'
	recentVideosStatement = "content-type:\"/page/page-video\""
}

return videosHelper.getVideoList(recentVideosStatement)
