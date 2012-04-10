class AddContent < ActiveRecord::Migration
  def change
    Content.create!(:identifier => 'index_header', :content => 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.')
    Content.create!(:identifier => 'people_header', :content => '..s autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.')
    Content.create!(:identifier => 'blog_header', :content => 'Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.')
    Content.create!(:identifier => 'about_header', :content => 'Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius.')
    Content.create!(:identifier => 'about_content', :content => 'Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum.')
    Content.create!(:identifier => 'contact_content', :content => 'Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima.')
  end
end
