require 'spec_helper'

describe 'wkhtmltopdf' do

  describe file('/usr/local/bin/wkhtmltopdf') do
    it { should be_a_file }
    it { should be_owned_by 'root' }
    it { should be_executable }
    # fails on centos5 because /sbin/runuser isn't in $PATH?
    # it { should be_executable.by_user('vagrant') }
  end

  describe command('/usr/local/bin/wkhtmltopdf --version') do
    it "should report correct version" do
      subject.should return_stdout /wkhtmltopdf 0\.12\.1/
    end
  end

end
