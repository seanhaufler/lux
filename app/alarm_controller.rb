class AlarmController < UIViewController

  def viewDidLoad
    self.title = 'Alarm'
    self.view.addSubview(alarmPicker)
    self.view.addSubview(alarmLabel)
    self.view.addSubview(startButton)

    # Set initial time & label
    alarmSelected

    startButton.when(UIControlEventTouchUpInside) do
        UIApplication.sharedApplication.keyWindow.addSubview(alarmMode)
    end
 end

  #############
  #  Actions  #
  #############

  def alarmSelected
    time_late = alarmPicker.date
    time_early = time_late.dateByAddingTimeInterval(-1800) # 30 minutes earlier
    text_late = alarmFormatter.stringFromDate(time_late)
    text_early = alarmFormatter.stringFromDate(time_early)

    label = "Wake up between #{text_early} - #{text_late}"
    alarmLabel.text = label
    p label
  end

  ##############
  # Properties #
  ##############

  def alarmPicker
    @alarmPicker ||= begin
      _alarmPicker = UIDatePicker.new
      _alarmPicker.addTarget(self,
                            action:'alarmSelected',
                            forControlEvents:UIControlEventValueChanged)
      _alarmPicker.datePickerMode = UIDatePickerModeTime

      size = _alarmPicker.sizeThatFits(CGSizeZero)
      _alarmPicker.frame = CGRect.new([0, self.view.frame.origin.y],
                                     [size.width, size.height])
      _alarmPicker
    end
  end

  def alarmLabel
    @alarmLabel ||= begin
      _alarmLabel = UILabel.alloc.initWithFrame([[0, 300], [280, 44]])
      _alarmLabel.textColor = UIColor.redColor
      _alarmLabel.font = UIFont.systemFontOfSize(14)
      _alarmLabel.backgroundColor = nil
      _alarmLabel
    end
  end

  def startButton
    @startButton ||= begin
      title = "Start"
      margin = 20
      _startButton = UIButton.buttonWithType(UIButtonTypeCustom)
      _startButton.setTitle(title, forState: UIControlStateNormal)
      _startButton.setTitleColor(UIColor.whiteColor, forState: UIControlStateNormal)
      _startButton.backgroundColor = UIColor.orangeColor
      _startButton.layer.borderColor = UIColor.blackColor
      _startButton.layer.borderWidth = 0.5;
      _startButton.layer.cornerRadius = 2;
      size = _startButton.sizeThatFits(CGSizeZero)
      _startButton.frame = CGRect.new([margin, 400],
                                      [size.width, size.height])
      _startButton
    end
  end

  def alarmMode
    @alarmMode ||= begin
        _frame = UIScreen.mainScreen.bounds
        _image = UIImage.imageNamed("alarm_mode.png")
        _alarmMode = UIImageView.alloc.initWithImage(_image)
        _alarmMode
    end
  end

  ###########
  # Helpers #
  ###########

  def alarmFormatter
    @alarmFormatter ||= begin
      _alarmFormatter = NSDateFormatter.new
      _alarmFormatter.setDateStyle(NSDateFormatterFullStyle)
      _alarmFormatter.setTimeStyle(NSDateFormatterShortStyle)
      _alarmFormatter.setDateFormat('HH:mm aa')
      _alarmFormatter
    end
  end

end


