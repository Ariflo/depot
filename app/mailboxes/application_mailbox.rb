class ApplicationMailbox < ActionMailbox::Base
  routing  /.*/ => :support
end
