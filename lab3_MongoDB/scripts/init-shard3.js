rs.initiate(
   {
      _id: "rs-shard-3",
      version: 1,
      members: [
         { _id: 0, host : "shard3-a:27017" },
         { _id: 1, host : "shard3-b:27017" },
		 { _id: 2, host : "shard3-c:27017" },
      ]
   }
)