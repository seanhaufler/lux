class SplashController < UIViewController
  def viewDidLoad
    self.view.addSubview(splash)
    sleep(3)
    UIApplication.sharedApplication.tabBarController
  end

  def splash
    @splash ||= begin
        _frame = UIScreen.mainScreen.bounds
        _image = UIImage.imageNamed("lux-logo.png")
        _splash = UIImageView.alloc.initWithImage(_image)
        _splash
    end
  end
end
