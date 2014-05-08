json.array!(@receipts) do |receipt|
  json.extract! receipt, :id, :date_of_transaction, :user_id
  json.url receipt_url(receipt, format: :json)
end
