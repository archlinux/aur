# plsnocompute

Masks resource-draining user services so they don't run.

## Masked services

* Baloo (KDE file-indexer)
* DrKonqi (KDE crash-handler)
* LocalSearch (GNOME file-indexer)

## Frequently Unasked Questions

Q: Why mask these services instead of just, not installing them? I am smart.

A: Because they're dependencies for large desktop environments and it's hard to install said environments without these services without a lot of extra work. And masking these services is the path of least resistance.

## License

Released to the public domain to the greatest extent possible via the [CC0 License].

[CC0 License]: ./LICENSE.md
