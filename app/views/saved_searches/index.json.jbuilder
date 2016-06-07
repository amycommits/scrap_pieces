json.array!(@saved_searches) do |saved_search|
  json.extract! saved_search, :id, :name, :user_id, :description, :params, :searched_index
  json.url saved_search_url(saved_search, format: :json)
end
