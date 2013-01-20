require 'spec_helper'
require 'pry'
describe Octopusci do

  describe '.root' do
    subject { Octopusci.root }
  
    context "returns the application root path" do
      let(:app_root) {File.dirname(File.dirname(File.dirname(__FILE__)))}
      it { subject.to_s.should eq app_root }
      it { should be_a Pathname }
    end
    it { should respond_to :join }
  end
  
  # Conform to Rack/Passenger public folder location for easier deployment
  describe "view file and directory presence" do
    let(:views) {%w[index job job_summary layout].map{|i|i<<'.erb'}}
    let(:dir) { Octopusci.root.join('lib','octopusci','server','views') }

    it "contains needed erb files" do
      views.each { |view| dir.join(view).should exist }
    end
  end
end