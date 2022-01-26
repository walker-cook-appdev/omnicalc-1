class ApplicationController < ActionController::Base

  def blank_square_form
    render({:template => "calculation_templates/square_form.html.erb"})
  end

  def blank_random_form
    render({:template => "calculation_templates/random_form.html.erb"})
  end

  def blank_square_root_form
    render({:template => "calculation_templates/square_root_form.html.erb"})
  end

  def blank_payment_form
    render({:template => "calculation_templates/payment_form.html.erb"})
  end

  def calculate_square
    @num = params.fetch("number").to_f
    @square_of_num = @num ** 2
    render({:template => "calculation_templates/square_results.html.erb"})
  end

  def calculate_random

    @lower = params.fetch("user_min").to_f
    @upper = params.fetch("user_max").to_f
    @random = rand(@lower..@upper)
    render({:template => "calculation_templates/random_results.html.erb"})
    
  end

  def calculate_square_root
    @num = params.fetch("number").to_f
    @square_root_of_num = Math.sqrt(@num)
    render({:template => "calculation_templates/square_root_results.html.erb"})
    
  end

  def calculate_payment
    @apr = params.fetch("apr").to_f.round(4)
    @years = params.fetch("num_years").to_i
    @principal = params.fetch("principal").to_f
    @monthly_apr = (@apr/12)/100
    @months = @years*12

    #@monthly_payment = @principal * (@monthly_apr*((1+@monthly_apr)**@months)) / (((1+@monthly_apr)**@months) - 1)
    @monthly_payment = (@principal * @monthly_apr) / (1 - (1 + @monthly_apr)**(-@months))
    @monthly_payment = @monthly_payment.round(2)
    render({:template => "calculation_templates/payment_results.html.erb"})
  end


end
