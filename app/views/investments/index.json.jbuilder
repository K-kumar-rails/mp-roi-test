json.array!(@investments) do |investment|
  json.extract! investment, :sq_feet, :cost, :sale_val
  json.url investment_url(investment, format: :json)
end
