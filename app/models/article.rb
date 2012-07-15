class Article < ActiveRecord::Base
  attr_accessible :body, :body_html, :slug, :title, :locale, :translations_attributes
  extend FriendlyId
  friendly_id :title, use: :slugged

  translates :title, :body, :body_html
  accepts_nested_attributes_for :translations

  before_save :generate_html

  class Translation
    attr_accessible :locale, :title, :body, :body_html
  end

  def translations_attributes=(attributes)
    new_translations = attributes.values.reduce({}) do |new_values, translation|
      translation.merge!("body_html" => RDiscount.new(translation["body"] || "").to_html )
      new_values.merge! translation.delete("locale") => translation
    end
    set_translations new_translations
  end

private

  def should_generate_new_friendly_id?
    new_record?
  end

  def generate_html
    self.body_html = RDiscount.new(self.body || "").to_html
  end
end
