class ProcessamentoChannel < ApplicationCable::Channel
  def subscribed(jid)
    stream_from "processamento:#{data['jid']}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
