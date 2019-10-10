package scripts.utils

import java.util.Properties
import org.craftercms.engine.service.UrlTransformationService
import org.elasticsearch.action.search.SearchRequest
import org.elasticsearch.index.query.QueryBuilders
import org.elasticsearch.search.builder.SearchSourceBuilder
import org.elasticsearch.search.sort.FieldSortBuilder
import org.elasticsearch.search.sort.SortOrder

// TODO: remove
import groovy.util.logging.Slf4j

@Slf4j
class VideosHelper {

  def searchService
  def siteItemService
  def start

  def elasticsearch
  UrlTransformationService urlTransformationService

  VideosHelper(elasticsearch, UrlTransformationService urlTransformationService, start) {
    this.elasticsearch = elasticsearch
    this.urlTransformationService = urlTransformationService
    this.start = Integer.parseInt(start)
  }
  
  def getVideoList(statement) {
    def q = "${statement}"

    def builder = new SearchSourceBuilder()
      .query(QueryBuilders.queryStringQuery(q))
      .from(start)
      .size(10)
      .sort(new FieldSortBuilder("createdDate_dt").order(SortOrder.DESC))

    def result = elasticsearch.search(new SearchRequest().source(builder))

    log.info("----------------------------------------RESULTS---------------------------------------------\n")
    log.info("{}", result)
    log.info("----------------------------------------RESULTS---------------------------------------------\n")

    if(result.hits.hits) {
      return processResults(result)
    } else {
      return []
    }
  }

  private def processResults(result) {
    def videos = []
    def hits = result.hits.hits
    def processedResults = [:]

    if (hits) {
      hits.each {hit ->
        def video = hit.getSourceAsMap()
        videos << video
      }
    }

    return ["totalCount": videos.size(), "responseVideos": videos, "selectedPage": (start/10)+1]
  }
}