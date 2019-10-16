package scripts.utils

import java.util.Properties
import org.craftercms.engine.service.UrlTransformationService
import org.elasticsearch.action.search.SearchRequest
import org.elasticsearch.index.query.QueryBuilders
import org.elasticsearch.search.builder.SearchSourceBuilder
import org.elasticsearch.search.sort.FieldSortBuilder
import org.elasticsearch.search.sort.SortOrder

class CarouselHelper {

  def elasticsearch
  UrlTransformationService urlTransformationService

  CarouselHelper(elasticsearch, UrlTransformationService urlTransformationService) {
    this.elasticsearch = elasticsearch
    this.urlTransformationService = urlTransformationService
  }

  def getCarouselList(statement) {
    def q = "${statement}"

    def builder = new SearchSourceBuilder()
      .query(QueryBuilders.queryStringQuery(q))
      .from(0)
      .size(10)
      .sort(new FieldSortBuilder("createdDate_dt").order(SortOrder.DESC))

    def result = elasticsearch.search(new SearchRequest().source(builder))

    if (result.hits.hits) {
      return processResults(result.hits.hits)
    } else {
      return []
    }
  }

  private def processResults(hits) {
    def videos = []

    if (hits) {
      hits.each {hit ->
        def video = hit.getSourceAsMap()
        videos << video
      }
    }

    return videos
  }
}

