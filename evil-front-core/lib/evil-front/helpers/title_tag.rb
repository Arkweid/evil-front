# encoding: utf-8

require 'i18n'

module EvilFront::Helpers
  # Return title tag with current page title. It will just join page titles
  # from `title` helper and `site` name.
  #
  # By default, separator will be m-dash for Russian and n-dash for others.
  #
  #   html
  #     head
  #       = title_tag('Foo Company')
  #
  # Separator will be taken by current locale. But, you can change it by
  # `separator` option:
  #
  #   = title_tag('Foo Company', separator: ' * ')
  def title_tag(*site)
    @evil_front_titles ||= []
    options   = site.extract_options!
    separator = options[:separator] || (I18n.locale == :ru ? ' — ' : ' - ')
    titles    = (@evil_front_titles + site).compact
    titles    = titles.join(separator)
    titles    = raw(titles) if respond_to? :raw
    EvilFront.html_safe("<title>#{ titles }</title>")
  end
end
