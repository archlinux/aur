polkit.addRule(function (action, subject) {
  if (subject.isInGroup("wheel")) {
    return polkit.Result.YES;
  }
});
