# encoding: utf-8

# coding: utf-8

# 默认配置项
# 如需新增设置项，请在这里初始化默认值，然后到后台修改


# site title ,slogan and author HTML
SiteConfig.save_default("site_title","elele")
SiteConfig.save_default("site_slogan","技术型纯diao")
SiteConfig.save_default("site_author","Elele")
SiteConfig.save_default("site_author_username","elele")
SiteConfig.save_default("site_author_password","admin519728")

# Footer HTML
SiteConfig.save_default("about_me_html",<<-eos
<div class="about">
  <p>移动互联网底层小diao </p>
</div>
eos
)

# menu HTML
SiteConfig.save_default("menu_html",<<-eos
  	<ul>
 			<li><a href="/">首页</a></li>
			<li><a href="/page/book">Book</a></li>
			<li><a href="/page/movie">Movie</a></li>
			<li><a href="/page/music">Music</a></li>
			<li><a href="/page/travel">Travel</a></li>
			<li><a href="/page/toolkit">Toolkit</a></li>
			<li><a href="/page/team">Team</a></li>
			<li><a href="/page/about">About</a></li>
		</ul>
eos
)

# Footer HTML
SiteConfig.save_default("footer_html",<<-eos
  <p>Copyright &copy;2008-2013 - Lovingly authored by Elele - All my work is <a href="http://www.opensource.org/licenses/MIT">MIT licensed, Open and Free</a>. </p>
  <p>
    Powered by <a href="http://www.elele.me/" target="_blank" title="Elele is a blog  in Ruby">Elele</a> - Theme by <a href="http://www.elele.me/" target="_blank" title="Elele's blog.">@elele</a> 
    - Build by <a href="http://daringfireball.net/projects/markdown/" target="_blank" title="Markdown is a text-to-HTML conversion tool for web writers">Markdown</a>,
    <a href="https://github.com/elele" target="_blank" title="GitHub">GitHub</a>,  
  </p>	
eos
)
 

#some default seeds
c = Category.create(:name => "默认分类")

#pages
Page.create(:slug=>"about", :title => "About")
Page.create(:slug=>"book", :title => "Book")
Page.create(:slug=>"movie", :title => "Movie")
Page.create(:slug=>"music", :title => "Music")
Page.create(:slug=>"team", :title => "Team")
Page.create(:slug=>"travel", :title => "travel")
Page.create(:slug=>"toolkit", :title => "Toolkit")

#Post
Post.create(:category_id => c.id, :title => "blog post title", :body => "This is a new post body,support **Markdown** format..",:tag_list => "demo,tag")

#Site
Site.create(:name => "Elele Blog",:url => "http://www.elele.me")
