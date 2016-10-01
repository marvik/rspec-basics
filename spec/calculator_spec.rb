require_relative '../calculator'

describe Calculator do

  describe 'class methods' do
    describe '.version' do
      it 'returns correct version' do
        expect(described_class.version).to eq('0.1.0')
      end
    end
  end

  describe 'arithmetic operations' do
    describe '#add' do
      it 'adds numbers' do
        expect(subject.add(1, 4, 9)).to eq(14)
      end
    end

    describe '#subtract' do
      it 'subtracts numbers' do
        expect(Calculator.new.subtract(1, 4)).to eq(-3)
      end
    end

    describe '#divide' do
      it 'divides numbers' do
        expect(subject.divide(10, 2)).to eq(5)
      end

      context 'when the second argument is zero' do
        it 'raises an exception' do
          expect{ subject.divide(10, 0) }.to raise_exception(ZeroDivisionError)
        end
      end
    end
  end

  describe 'generic instance methods' do
    describe '#binary' do
      let!(:binary_number) { '111' }

      it 'returns binary representation of the value' do
        expect(subject.binary(7)).to eq(binary_number)
      end
    end

    describe '#export' do
      let!(:file_name)   { 'result_test.txt' }
      let(:result_file)  { File.open(file_name) }

      subject { Calculator.new(file_name) }

      before do
        subject.divide(10, 5)
        subject.export
      end

      after do
        File.delete(file_name)
      end

      it 'writes result to file' do
        expect(File.exists?(file_name)).to be true
      end

      it 'should export correct result to file' do
        expect(result_file.read).to eq('2')
      end
    end
  end

end
