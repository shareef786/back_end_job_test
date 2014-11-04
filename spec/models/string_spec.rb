require "spec_helper"
require "ext/string"

describe String do
  context "#to_arabic" do
    it "converts a Roman numeral to an integer" do
      expect("MMCLIV".to_arabic).to eq 2_154
    end

    it "converts 'MMMMCMXCIX' to 4999" do
      expect("MMMMCMXCIX".to_arabic).to eq 4999
    end

    it "converts 'MMMMCXXXIII' tp 4133" do
      expect('MMMMCXXXIII'.to_arabic).to eq 4133
    end

    it "converts 'CLXX' tp 170" do
      expect('CLXX'.to_arabic).to eq 170
    end

    it "converts 'DCCCXVIII' tp 818" do
      expect('DCCCXVIII'.to_arabic).to eq 818
    end

    it "converts 'MLXVII' tp 1067" do
      expect('MLXVII'.to_arabic).to eq 1067
    end

    it "converts 'DLXXXX' tp 590" do
      expect('DLXXXX'.to_arabic).to eq 590
    end

    it "converts 'MMDXXI' tp 2521" do
      expect('MMDXXI'.to_arabic).to eq 2521
    end

    it "converts 'MMMMDLXXXXVIII' tp 4598" do
      expect('MMMMDLXXXXVIII'.to_arabic).to eq 4598
    end

    it "converts 'MXXII' tp 1022" do
      expect('MXXII'.to_arabic).to eq 1022
    end

    it "converts a Roman numeral VIIII to IX" do
      expect("VIIII".to_arabic.to_roman).to eq 'IX'
    end
  end

  context "#another_to_arabic_number" do
    it "converts 'V' to 5" do
      expect('V'.another_to_arabic_number).to eq 5
    end

    it "converts 'MCMIV' to 1904" do
      expect("MCMIV".another_to_arabic_number).to eq 1904
    end

    it "converts 'MMMMCMXCIX' to 4999" do
      expect('MMMMCMXCIX'.another_to_arabic_number).to eq 4999
    end

    it "raises an exception for 'blah'" do
      expect{ "blah".another_to_arabic_number }.to raise_error
    end

    it "returns nil for empty string" do
      expect("".another_to_arabic_number).to be_nil
    end
  end

  context "convert farenhit to celsius and vice versa" do
    it "converts '36.89c' to '98.4'" do
      expect('36.89'.to_farenhit).to eq 98.4
    end

    it "converts '98.4f' to '36.89c'" do
      expect("98.4".to_celsius).to eq 36.89
    end
  end

end
