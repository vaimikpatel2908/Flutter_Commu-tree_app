class Favourite {
    int favId;
    String userId;
    String favUserId;
    int status;

    Favourite({
        this.favId,
        this.userId,
        this.favUserId,
        this.status,
    });

    int get favoriteId => favId;
    String get favouriteUserId => favUserId;
    String get favouriteFavUserId => favUserId;
    int get favouriteStatus => status;

    factory Favourite.fromJson(Map<String, dynamic> data) => new Favourite(
        favId: data["favId"],
        userId: data["userId"],
        favUserId: data["favUserId"],
        status: data["status"],
    );

    Map<String, dynamic> toJson() => {
        "favId": favId,
        "userId": userId,
        "favUserId": favUserId,
        "status": status,
    };
}