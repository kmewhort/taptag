RSpec.describe 'When mifare card is Absent', :hardware, :mifare do
  before do
    require 'taptag/nfc'
  end

  it 'gets a nil card uid' do
    u = Taptag::NFC.card_uid
    expect(u).to be_nil
  end

  it 'cannot read from the card' do
    err = nil

    begin
      Taptag::NFC.read_mifare_block(6)
    rescue IOError => e
      err = e
    end

    expect(e).to be_a(IOError)
  end

  it 'cannot write to the card' do
    err = nil

    begin
      Taptag::NFC.write_mifare_block(6, Array.new(16, 0))
    rescue IOError => e
      err = e
    end

    expect(e).to be_a(IOError)
  end
end
