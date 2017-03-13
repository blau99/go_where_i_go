class BestDishesController < ApplicationController
  def index
    @q = BestDish.ransack(params[:q])
    @best_dishes = @q.result(:distinct => true).includes(:restaurant).page(params[:page]).per(10)

    render("best_dishes/index.html.erb")
  end

  def show
    @best_dish = BestDish.find(params[:id])

    render("best_dishes/show.html.erb")
  end

  def new
    @best_dish = BestDish.new

    render("best_dishes/new.html.erb")
  end

  def create
    @best_dish = BestDish.new

    @best_dish.restaurant_id = params[:restaurant_id]

    save_status = @best_dish.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/best_dishes/new", "/create_best_dish"
        redirect_to("/best_dishes")
      else
        redirect_back(:fallback_location => "/", :notice => "Best dish created successfully.")
      end
    else
      render("best_dishes/new.html.erb")
    end
  end

  def edit
    @best_dish = BestDish.find(params[:id])

    render("best_dishes/edit.html.erb")
  end

  def update
    @best_dish = BestDish.find(params[:id])

    @best_dish.restaurant_id = params[:restaurant_id]

    save_status = @best_dish.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/best_dishes/#{@best_dish.id}/edit", "/update_best_dish"
        redirect_to("/best_dishes/#{@best_dish.id}", :notice => "Best dish updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Best dish updated successfully.")
      end
    else
      render("best_dishes/edit.html.erb")
    end
  end

  def destroy
    @best_dish = BestDish.find(params[:id])

    @best_dish.destroy

    if URI(request.referer).path == "/best_dishes/#{@best_dish.id}"
      redirect_to("/", :notice => "Best dish deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Best dish deleted.")
    end
  end
end
