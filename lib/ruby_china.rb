class RubyChina
	URL = "http://ruby-china.org/api"
	def self.get_ruby_china_favorite
		c = Category.find_or_create_by(name: "RubyChina")
		m = Mechanize.new
		page = m.get("#{URL}/users/elele/topics/favorite.json")
		remote_data = JSON.parse(page.body)
		remote_ids = remote_data.map{|i| i["id"]}
		ids = remote_ids - c.posts.map{|p| p.remote_id}
		if ids
			ids.each do |remote_id|
				doc = m.get("#{URL}/topics/#{remote_id}.json")
				content = JSON.parse(doc.body)
				post = Post.new
				post.remote_id = content["id"]
				post.body = content["body"]
				post.category = c 
				post.state = 1
				post.title = content["title"]
				post.save
			end
		end
		# data_ids = Post
	end
end