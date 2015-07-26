module UsersHelper
  
  # Returns the Gravatar for the given user.
  def gravatar_for(user, options = {size: 50})
  	if (user.email == "yurilliam@footprint.com") # change profile for admin
  		size = options[:size]
    	gravatar_url = "footprint.png"
    	image_tag(gravatar_url, alt: user.name, class: "adminprofile")
    else
    	gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    	size = options[:size]
    	gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    	image_tag(gravatar_url, alt: user.name, class: "gravatar")
    end
  end

end
