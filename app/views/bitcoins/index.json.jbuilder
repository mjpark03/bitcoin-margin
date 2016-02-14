json.array!(@bitcoins) do |bitcoin|
  json.extract! bitcoin, :id, :company, :last
  json.url bitcoin_url(bitcoin, format: :json)
end
