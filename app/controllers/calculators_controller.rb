class CalculatorsController < ApplicationController
  def new
    @calculator = Calculator.new
  end

  def create
    calculator_params = params[:calculator].reject { |k,_v| k.include?('owner_birth') || k.include?('driving_licence_issue_date') }
    @calculator = Calculator.new(calculator_params)
    @calculator.owner_birth = Calculator.format_date(params[:calculator], "owner_birth")
    @calculator.driving_licence_issue_date = Calculator.format_date(params[:calculator], "driving_licence_issue_date")
    @calculator.request = request
    if @calculator.deliver
      flash[:notice] = 'Dziękujemy za wiadomość. Skontaktujemy się jak najszybciej!'
    else
      flash[:error] = 'Nie można wysłać wiadomości.'
    end
    redirect_to root_path
  end

  # private
  #
  # def calculator_params
  #   owner_birth = Date.new calculator["owner_birth(1i)"].to_i, event["owner_birth(2i)"].to_i, event["owner_birth(3i)"].to_i
  #   driving_licence_issue_date = Date.new calculator["driving_licence_issue_date(1i)"].to_i, event["driving_licence_issue_date(2i)"].to_i, event["driving_licence_issue_date(3i)"].to_i
  #   params.require(:calculator).permit(:brand, :model, :capacity, :year, :registered_zipcode, owner_birth,
  #                                      driving_licence_issue_date, :previous_insurance_company, :last_policy_discount,
  #                                      :last_year_damage_amount, :contact_name, :email, :phone_number)
  # end
end
