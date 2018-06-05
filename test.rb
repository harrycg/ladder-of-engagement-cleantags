require 'nationbuilder'

client = NationBuilder::Client.new('aycc', ENV['NATIONBUILDER_APIKEY'], retries: 8)

puts "Loading people with tag is: awesome core q2 2018"

filter = {
  tag: "is:%20awesome%20core%20q2%202018"
  }
  
response = client.call(:people_tags, :people, filter)

page = NationBuilder::Paginator.new(client, response)

people = []
while page.next?
  people += page.body['results']
  page = page.next
end  


people.each do |person|
  email = person['email']
    first_name = person['first_name']
    last_name = person['last_name']
  id = person['id']
  
puts "#{email}"


params = {
 id: "#{id}",
  tagging: {
    tag: "is: community 2018"
  }
  
}
  client.call(:people, :bulk_tag_removal , params)

end

=begin
    client.call(:people, :tag_person , params3)

=end
