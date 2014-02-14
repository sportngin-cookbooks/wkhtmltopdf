require 'spec_helper'

describe 'wkhtmltopdf' do

  describe file('/usr/local/bin/wkhtmltopdf') do
    it { should be_a_file }
    it { should be_owned_by 'root' }
    it { should be_executable.by_user('vagrant') }
  end

  describe command('/usr/local/bin/wkhtmltopdf --version') do
    it "should be installed" do
      subject.should return_stdout /wkhtmltopdf\s0\.12\.0/
    end
  end

end
