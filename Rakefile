# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  # app.vendor_project('vendor/BluetoothManager.framework', :static, :products => ['BluetoothManager'])

  app.name = 'Lux'
  app.frameworks << "QuartzCore"
  app.frameworks << "BluetoothManager"
  app.provisioning_profile = '/Users/newt/Library/MobileDevice/Provisioning Profiles/E1495B6F-8C24-46A5-A793-A0A56E2FD3F6.mobileprovision'
  # app.codesign_certificate = ''
end
