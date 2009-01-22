# Flickry (by wideopenspac.es)

Flickry is a wrapper for Flickraw that makes working with the Flickr API safe & 
easy by parsing the Flickraw response into the appropriate objects. 

Now features support for Comments, Tags, Locations (including woeid and place_id 
for region, county, etc)!

## Installation

    sudo gem install wideopenspaces-flickry
 
## Using with Rails (2.2+)

In `config/environments.rb`, add:

    config.gem "wideopenspaces-flickry", :source => "http://gems.github.com", :lib => 'flickry'

Add the following in `config/initializers/flickr.rb`:
 
    # This is how to authenticate on flickr website.
    # You need an API key for that, see http://www.flickr.com/services/api/keys/
    API_KEY='your-api-key-here'
    SHARED_SECRET='your-secret-here'
    begin
      FlickRaw.api_key=API_KEY
      FlickRaw.shared_secret=SHARED_SECRET
    rescue
    end

## Usage

    pic = Flickry::Photo.new 3008067483
 
    pic.urls
    ["http://www.flickr.com/photos/..."]
 
**Dates**
 
    pic.uploaded_at
    => Thu Nov 06 13:27:13 -0700 2008
    pic.taken_at
    => Tue Nov 04 16:39:46 -0700 2008
    pic.posted_at
    => Thu Nov 06 13:27:13 -0700 2008
    pic.last_updated_at
    => Sat Jan 10 14:18:29 -0700 2009
 
**License**

    pic.license
    => "Attribution-NonCommercial-ShareAlike License"
    pic.license.url
    => "http://creativecommons.org/licenses/by-nc-sa/2.0/"
 
**Sizes**

    pic.sizes.medium
    => #<Flickry::Size source="http://farm4.static.flickr.com/....jpg", url="http://www.flickr.com/photos/.../sizes/m/", height="500", media="photo", width="334">
    
    pic.sizes.medium.height
    => "500"
 
**People**

    person = pic.owner
    => #<Flickry::Person location="", nsid="", realname="", username="", photosurl="", profileurl="">
    
    person.profile
    => "http://www.flickr.com/people/.../"
    
    person.photos
    => "http://www.flickr.com/photos/.../"
 
**Location**

    pic.location
    => #<Flickry::Location place_id="", region="", woeid="", country="", accuracy="", county="", latitude=41.8, locality="", longitude=-87.6, neighbourhood="">
    
    reg = pic.location.region
    => "Illinois"
    
    reg.place_id        # Look ma, that string has methods!
    => "<place_id>"
    reg.woeid
    => "<woeid>"
 
country, region, county, locality, and neighbourhood all *look* like strings but have woeid and place_id attributes.

**Tags**

    pic.tags
    => ["hdr", "trump", "skyscraper", "skyline"]
    
    pic.tag_list
    => "hdr, trump, skyscraper, skyline"

**Comments**

    pic.comments
    => ["beautiful", "That HDR trumps others I've seen! Nice work! :)"]
    
    pic.comments.last
    => "That HDR trumps others I've seen! Nice work! :)"
    
    pic.comments.last.author
    => #<Flickry::Person location="", nsid="", realname="", username="", photosurl="", profileurl="">  
    
    pic.comments.last.comment_id
    => "215779-3008067483-72157608738732709"
    
    pic.comments.last.created_at
    => Fri Nov 07 10:38:42 -0700 2008
    
    pic.comments.last.permalink
    => "http://www.flickr.com/photos/unquiet/3008067483/#comment72157608738732709"


## Contributing

This thing needs tests! I was running tests against the flickr api directly but want 
to stub those. If you feel like getting there before I do, go right ahead!