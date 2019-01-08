# Generated via
#  `rails generate hyrax:work Work`
module Hyrax
  class WorkPresenter < Hyrax::WorkShowPresenter

    # JL : 07/12/2018
    delegate :genre, to: :solr_document
    delegate :dris_page_no, to: :solr_document


    delegate :copyright_holder, to: :solr_document

    delegate :digital_object_identifier, to: :solr_document
    delegate :dris_unique, to: :solr_document
    delegate :language_code, to: :solr_document
    delegate :role, to: :solr_document
    delegate :sponsor, to: :solr_document
    delegate :publisher_location, to: :solr_document
    delegate :support, to: :solr_document
    delegate :medium, to: :solr_document
    delegate :type_of_work, to: :solr_document
    delegate :subject_lcsh, to: :solr_document
    delegate :subject_local, to: :solr_document
    delegate :subject_name, to: :solr_document
    delegate :alternative_title, to: :solr_document
    delegate :series_title, to: :solr_document
    delegate :collection_title, to: :solr_document
    delegate :virtual_collection_title, to: :solr_document
    delegate :provenance, to: :solr_document
    delegate :culture, to: :solr_document

  end
end