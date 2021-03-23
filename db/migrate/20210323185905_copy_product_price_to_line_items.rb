class CopyProductPriceToLineItems < ActiveRecord::Migration[6.1]
  def up
    Product.all.each do |product|
      LineItem.find_by(product_id: product.id) do | line_item |
        line_item.price = Product.price
      end
    end
  end

  def down
    LineItem.where("price>0.01").each do |line_item|
      LineItem.create(
        cart_id: line_item.cart_id,
        product_id: line_item.product_id,
      )
      # remove original item
      line_item.destroy
    end
  end
end
