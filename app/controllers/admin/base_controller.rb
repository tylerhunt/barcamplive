class Admin::BaseController < ApplicationController
  before_filter :verify_access
  layout 'admin'
end
