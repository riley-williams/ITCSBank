class AccountsController < ApplicationController
    before_action :require_login
    
    def index
        @account = Account.new
        @accounts = current_user.accounts
    end
    
    def show
        @account = current_user.accounts.find(params[:id])
    end
    
    def new
        @account = current_user.accounts.build
    end
    
    def create
        @account = current_user.accounts.build(account_params)
        
        if @account.save
            redirect_to account_path(@account)
        end
    end
    
    def edit
        @account = current_user.accounts.find(params[:id])
    end
    
    def update
        @account = current_user.accounts.find(params[:id])
        
        if @account.update(account_params)
            redirect_to @account
        else
            render 'edit'
        end
    end
    
    def destroy
        @account = current_user.accounts.find(params[:id])
        @account.destroy
        redirect_to accounts_path
    end
    
    private
    def account_params
        params.require(:account).permit(:name, :description)
    end
    
end
