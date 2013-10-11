# encoding: utf-8

class AdReportsController < ApplicationController

  belongs_to :advertisement
  belongs_to :medium, :throught => :advertisement
end
