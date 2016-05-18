class CartItem < CDQManagedObject
  # Scopes need to be sorted. We'll try and figure out how you
  # want it sorted automatically if it's not, and give you a
  # warning in the REPL.
  #scope :sort_created_at, sort_by(:created_at, order: :descending)

  scope :sort_created_at, sort_by(:created_at)

  # This is just a ProMotion TableScreen cell definition.
  # All cell options are available here. See the PM docs for details.
  def cell
    {
      # Use the model's properties to populate data in the hash
      title: product_name,
      editing_style: :delete,
      arguments: {}
#      subtitle: "Something else: #{something_else}"
    }
  end
end