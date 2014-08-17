class CarModel
  class << self
    def features(*args)
      args.each do |feature|
        attr_accessor "#{feature}_info", "#{feature}_data"
      end
    end
  end
  features :engine, :mine

  def create_meth(meth, *args, &block)
    self.class.send(:define_method, meth, *args, &block)
  end
end

a = CarModel.new
a.create_meth(:wo) { p "hjdsh"}
a.wo

