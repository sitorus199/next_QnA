<?php 
	
class ChatRooms
{
	private $message_id;
	private $chat_id;
	private $id_pengirim;
	private $message;
	private $status;
	private $created_on;
	protected $connect;

	public function setMessageId($chat_id)
	{
		$this->message_id = $message_id;
	}

	function getMessageId()
	{
		return $this->message_id;
	}

	public function setChatId($chat_id)
	{
		$this->chat_id = $chat_id;
	}

	function getChatId()
	{
		return $this->chat_id;
	}

	function setPengirimId($id_pengirim)
	{
		$this->id_pengirim = $id_pengirim;
	}

	function getPengirimId()
	{
		return $this->id_pengirim;
	}

	function setMessage($message)
	{
		$this->message = $message;
	}

	function getMessage()
	{
		return $this->message;
	}

	function setStatus($status)
	{
		$this->status = $status;
	}

	function getStatus()
	{
		return $this->status;
	}

	function setCreatedOn($created_on)
	{
		$this->created_on = $created_on;
	}

	function getCreatedOn()
	{
		return $this->created_on;
	}

	public function __construct()
	{
		require_once("Database_connection.php");

		$database_object = new Database_connection;

		$this->connect = $database_object->connect();
	}

	function save_chat()
	{
		$query = "
		INSERT INTO messages 
			(id_message, id_chat, id_pengirim, pesan, status, waktu_pengiriman) 
			VALUES (:id_message, :id_chat, :id_pengirim, :msg, :status, :waktu_pengiriman)
		";

		$statement = $this->connect->prepare($query);

		$statement->bindParam(':id_message', $this->message_id);

		$statement->bindParam(':id_chat', $this->chat_id);

		$statement->bindParam(':id_pengirim', $this->id_pengirim);

		$statement->bindParam(':msg', $this->message);

		$statement->bindParam(':status',$this->status);

		$statement->bindParam(':waktu_pengiriman', $this->created_on);

		$statement->execute();
	}

	function get_all_chat_data()
	{
		$query = "
		SELECT * FROM messages
		";

		$statement = $this->connect->prepare($query);

		$statement->execute();

		return $statement->fetchAll(PDO::FETCH_ASSOC);
	}

	function get_id_last_chat()
	{
		$query = "
		SELECT * FROM messages WHERE id_message=(SELECT max(id_message) FROM messages)
		";

		$statement = $this->connect->prepare($query);

		$statement->execute();

		return $statement->fetchAll(PDO::FETCH_ASSOC);
	}
}
	
?>