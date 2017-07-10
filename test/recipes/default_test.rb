# # encoding: utf-8

# Inspec test for recipe baseline::default

unless os.windows?
  describe user('root') do
    it { should exist }
  end
end

describe package('vim') do
  it { should be_installed }
end

describe package('htop') do
  it { should be_installed }
end
