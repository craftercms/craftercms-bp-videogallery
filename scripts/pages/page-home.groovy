import scripts.utils.CarouselHelper

def carouselHelper = new CarouselHelper(elasticsearch, urlTransformationService);
def carouselVideosStatement = "content-type:\"/page/page-video\" AND featured: \"true\""

templateModel.featuredVideos = carouselHelper.getCarouselList(carouselVideosStatement)