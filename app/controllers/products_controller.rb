class ProductsController < ApplicationController
  def index
    products = Product.all

    render "products/index", locals: { products: products }
  end

  def show
    render "products/show", locals: { product: product }
  end

  def new
    product = Product.new

    render "products/new", locals: { product: product }
  end

  def create
    @product = Product.new(product_params)
    
    if @product.save
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    render "products/edit", locals: { product: product }
  end

  def update
    if product.update(product_params)
      redirect_to product
    else
      render :edit, status: :unprocessable_entity, locals: { product: product }
    end
  end

  def destroy
    product.destroy

    redirect_to products_path
  end

  private
    def product
      @product ||= Product.find(params[:id])
    end

    def product_params
      params.expect(
        product: [
          :name, :description, :featured_image, :inventory_count
        ]
      )
    end
end
