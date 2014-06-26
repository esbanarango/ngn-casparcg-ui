class MessageSender
  include ActiveModel::Model

 	attr_accessor :body, :socket

  # Validations
  validates_presence_of :body

  def initialize(attributes={})
    super
    @socket ||= TCPSocket.new('localhost', '5250')
  end


  def send_message
    begin
    	socket.puts body
    ensure
      socket.close
    end
  end

end
