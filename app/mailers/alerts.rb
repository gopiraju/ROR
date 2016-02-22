class Alerts < ActionMailer::Base
  def new_product(product)
  	@product = product
     mail(:subject =>      "New product created",
      :from =>         'bhamgaram.mm@gmail.com',
      :to =>           'gopiraju.mm@gmail.com')
  end
end