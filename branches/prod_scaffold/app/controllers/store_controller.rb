class StoreController < ApplicationController
  skip_before_filter :authorize
  
  def index
    session[:cat_filter] = -1
    @art= Product.all
  end
  
  # GET store/sort/:column_name
  def sort
    begin
      sort_criteria = params[:id]
      filter_cat_id = Integer(session[:cat_filter])
      
      if filter_cat_id > -1
        temp_art = Product.find(:all,
                                :conditions => { :category_id => filter_cat_id },
                                :order => sort_criteria)
      else
        temp_art = Product.find(:all, :order => sort_criteria)
      end
        
      @art = temp_art

      respond_to do |format|
        format.html { render('index') }
        format.js   #AJAX -> don't redirect or render
      end
      
    rescue ActiveRecord::StatementInvalid
      puts 'Error sorting: due to invalid SQL. Most likely bad sort column criteria'
      redirect_to :action => 'index'
    end
  end
  
  # GET 'store/sort/category/:id' => 'store#cat_filter'
  def cat_filter
    begin
      filter_cat_id = params[:id]
      
      @art= Product.find(:all, :conditions => { :category_id => filter_cat_id })
      session[:cat_filter] = filter_cat_id
      
      render('index')
    rescue ActiveRecord::StatementInvalid
      puts 'Error filtering: probalby due to a bad category id as filter'
      redirect_to :action => 'index'
    end
  end

end
