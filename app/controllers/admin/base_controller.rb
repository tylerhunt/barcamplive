class Admin::BaseController < ApplicationController
  before_filter :verify_access, :except => %w(index show)
  layout 'admin'
end
