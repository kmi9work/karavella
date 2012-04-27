module ApplicationHelper
  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new)
    markdown.render(text.strip).html_safe
  end
end
