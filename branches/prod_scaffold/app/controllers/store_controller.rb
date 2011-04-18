class StoreController < ApplicationController
  def index
    puts "!!!!!!!!!!!!!!!!!!!! #{url_for(:action => 'sort_by_cat')}"
    session[:cat_filter] = -1
    @art = Product.all
  end
  
  # GET store/sort/:column_name
  def sort
    begin
      sort_criteria = params[:id]
      @art = Product.find(:all, :order => sort_criteria)
      puts "??????? here is the sort criteria: #{sort_criteria}"
      
      
      if (sort_criteria =~ /^[\d]+(\.[\d]+){0,1}$/) != nil
        # numbers are category ids from -> GET store/sort/category/1
        puts "it's a category #{sort_criteria.to_i}"
        @art = Product.find(:all,
                            :conditions => { :category_id => sort_criteria })
        session[:cat_filter] = sort_criteria
      end
      
      render('index')
    rescue ActiveRecord::StatementInvalid
      puts 'Error sorting: due to invalid SQL. Most likely bad sort column criteria'
      redirect_to :action => 'index'
    end
  end
  
  ## GET store/sort/category/1
  #def sort_by_cat
  #  begin
  #    sort_criteria = params[:cat_id]
  #    @art = Product.find(:all,:conditions => { :category_id => sort_criteria })
  #    #@art = Product.find_all_by_category(sort_criteria)
  #    
  #    puts "here is the sort criteria: #{sort_criteria}"
  #    session[:cat_filter] = sort_criteria
  #    render('index')
  #  rescue ActiveRecord::StatementInvalid
  #    puts 'Error sorting: due to invalid SQL. Most likely bad sort column criteria'
  #    redirect_to :action => 'index'
  #  end
  #end

end
