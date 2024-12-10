import clips

environment = clips.Environment()

if __name__ == '__main__':
    environment.load(path="baza.clp")

    # retrieve the fact template
    environment.reset()

    # execute the activations in the agenda
    environment.run()


