module Jekyll
  class LoremIpsumTag < Liquid::Tag

    LOREM_IPSUM_TEXT = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
      Fusce est est, pharetra eget enim at, rutrum venenatis dui. Mauris quis ligula
      vestibulum, porttitor lacus sed, finibus sapien. Donec efficitur nulla at
      nibh eleifend, et eleifend nisi tincidunt. Pellentesque tristique sem eget
      justo fermentum, id semper justo consectetur. Suspendisse tempus dictum
      sapien et mattis. Quisque neque lorem, ultricies at accumsan ullamcorper,
      porttitor at sapien. Fusce eleifend placerat elit, et interdum orci
      vestibulum eu. Cras sem ligula, suscipit ac laoreet mattis, pharetra ac
      turpis. Nam at sapien leo. Proin nec erat ac dui molestie sodales. Praesent
      tristique, lectus id egestas euismod, urna orci aliquam massa, vel
      hendrerit lacus enim venenatis mauris."

    def initialize(tag_name, length, tokens)
      super
      @length = if not length.nil? and length.to_i > 0
                  length.to_i 
                else 
                  80
                end
    end

    def render(context)
      LOREM_IPSUM_TEXT.split().first(@length).join(' ')
    end
  end
end

Liquid::Template.register_tag('lorem_ipsum', Jekyll::LoremIpsumTag)

