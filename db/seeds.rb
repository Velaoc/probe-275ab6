# Friendly placeholder entries so the wall has a pulse on first load.
# Safe to re-run: entries are skipped when the wall already has messages.
if GuestbookMessage.none?
  GuestbookMessage.create!(
    [
      { name: "Mira",  body: "First to sign — this wall feels important already." },
      { name: "Devon", body: "Left a message, saw the wall. 10/10 would sign again." },
      { name: "",      body: "No name, no problem. The wall remembers anyway." }
    ]
  )
end
