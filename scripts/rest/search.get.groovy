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
	// recentVideosStatement = 'content-type:"/page/page-video" AND (internal-name: *'+ search +'* OR tags.item.tagName: *'+search+'*)'
	// recentVideosStatement = "content-type:\"/page/page-video\" AND title: \".*" + search + ".*\""
	
	recentVideosStatement = "title: \".*" + search + ".*\""
	// recentVideosStatement = "title: \"" + search + "\""
} else {
	// recentVideosStatement = 'content-type:"/page/page-video" AND categories.item.key:"'+ path +'" AND (internal-name: *'+ search +'* OR tags.item.tagName: *'+search+'*)'
	// recentVideosStatement = "content-type:\"/page/page-video\" AND internal-name: \".*" + search + ".*\""
	recentVideosStatement = "content-type:\"/page/page-video\""
}

if(search == '' && (path != 'undefined' || path != " ")) {
	// recentVideosStatement = 'content-type:"/page/page-video" AND categories.item.key:"'+ path +'"'
	recentVideosStatement = "content-type:\"/page/page-video\""
}

return videosHelper.getVideoList(recentVideosStatement)
